# Splunk Enterprise Installer

## Microsoft Windows

`Splunk_enterprise_installer.cmd` is a short batch file which installs a very basic configuration of Splunk quietly with _the free licensing model_ enabled.  The script does however need the user to aFor good measure,uthenticate to splunk half-way through using the default credentials of `admin` and `changeme`.

The last section of the script also adds some trusted sites to the user's registry so that the splunk instance on localhost can be accessed without too many nagging messages from IE.

NB: Tested only with `splunk-6.4.3-b03109c2bad4-x64-release.msi` on Windows 2008 Server R2.

## Linux

Not supported, instead I suggest you use a Puppet module, or an Ansible role, etc.