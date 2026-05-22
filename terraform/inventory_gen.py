#!/usr/bin/env python3

import json
import sys
import yaml
import subprocess
import re

def write_yaml_to_file_from_dict(filename, data_dict):
    with open(filename, 'w') as f:
        yaml.dump(
            data_dict,
            f,
            default_flow_style=False,
            sort_keys=False,
            indent=2,
            allow_unicode=True
        )

def generate_inventory_dict(host_ip_dict, host_key_dict):
    inventory = {
        'mw_project': {
            'children': {
                'nginxproxy': {
                    'hosts': {}
                },
                'mw': {
                    'hosts': {}
                },
                'db': {
                    'hosts': {}
                },
                'dbreplica': {
                    'hosts': {}
                },
                'image': {
                    'hosts': {}
                },
                'backup': {
                    'hosts': {}
                },
                'zabbix': {
                    'hosts': {}
                }
            },        
            'vars': {}
        }
    }
    
    mw_server_cnt = 1
    
    for group, hosts in inventory['mw_project']['children'].items():
        for host, ip in host_ip_dict.items():
            pattern = re.escape(group) + r'_'
            group_match = re.search(pattern, host)
            if not group_match:
                continue
            host_name = group_match.group() + "server"
            if host_name == "mw_server":
                host_name += '_' + str(mw_server_cnt)
                mw_server_cnt += 1
            inventory['mw_project']['children'][group]['hosts'][host_name] = {
                'ansible_host': ip,
                'ansible_ssh_private_key_file': host_key_dict[host]
            }
            
       
    inventory['mw_project']['vars'] = {
        'connection_protocol': 'ssh',
        'ansible_user': 'ubuntu',
        'mw_site_path': '/var/www/mediawiki',
        'image_folder_path': '/mediawiki_images',
        'db_backup_folder_path': '/db_backup',
        'image_backup_folder_path': '/mediawiki_images_backup',
        'backup_scripts_folder_path': '/scripts',
        'temp_folder_path': '/backup_temp',
        'db_name': 'my_wiki',
        'db_user': 'wikiuser',
        'db_password': 'wikipass',
        'replica_name': 'my_wiki_replica',
        'replica_user': 'wiki_replica',
        'replica_password': 'wikireppass'
    }

    return inventory

if __name__ == '__main__':

    output_file_path = sys.argv[1]
    host_ip_dict = json.loads(subprocess.check_output(['terraform', 'output', '-json', 'vm_nat_ip'], text=True))
    host_key_dict = json.loads(subprocess.check_output(['terraform', 'output', '-json', 'vm_key_filename'], text=True))
    
    write_yaml_to_file_from_dict(output_file_path, generate_inventory_dict(host_ip_dict, host_key_dict))
