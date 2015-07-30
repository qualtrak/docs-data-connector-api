# Cookbook Name:: learn_chef_iis
# Recipe:: default
#
# Copyright (c) 2015 Qualtrak Solutions Ltd, All Rights Reserved.
powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Server).Installed"
end

powershell_script 'Install NET-Framework-45-Core' do
  code 'Add-WindowsFeature NET-Framework-45-Core'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name NET-Framework-45-Core).Installed"
end

powershell_script 'Install Web-Asp-Net45' do
  code 'Add-WindowsFeature Web-Asp-Net45'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Asp-Net45).Installed"
end

powershell_script 'Install Web-WebSockets' do
  code 'Add-WindowsFeature Web-WebSockets'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-WebSockets).Installed"
end

powershell_script 'Install NET-WCF-HTTP-Activation45' do
  code 'Add-WindowsFeature NET-WCF-HTTP-Activation45'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name NET-WCF-HTTP-Activation45).Installed"
end

powershell_script 'Install Windows Auth' do
  code 'Add-WindowsFeature Web-Windows-Auth'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Windows-Auth).Installed"
end

powershell_script 'Install IIS Mgmt Console' do
  code 'Add-WindowsFeature Web-Mgmt-Console'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name Web-Mgmt-Console).Installed"
end

powershell_script 'Install IIS Mgmt Service' do
  code 'Add-WindowsFeature Web-Mgmt-Service'
  guard_interpreter :powershell_script
  not_if "(Get-WindowsFeature -Name  Web-Mgmt-Service).Installed"
end

service 'w3svc' do
    action [:enable, :start]
end


