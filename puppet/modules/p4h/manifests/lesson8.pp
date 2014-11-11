# Puppet for Hackers course module by James
# Copyright (C) 2013-2014+ James Shubin
# Written by James Shubin <james@shubin.ca>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

# README: this is a module built for use with: Oh My Vagrant!

class p4h::lesson8() {

	file { '/root/README':
		content => "##lesson8
For this lesson, please do the following:
* Use the file: ensure => 'directory' type
** Use the `recurse`, `purge`, and `force` metaparameters
*** Add some files into the directory with puppet
**** Remove their definitions and make note of what happens
* Use an `inline_template` to perform a data transform
** It could be application of a ruby function
** It could return an array (which you'll have to parse out)
* Use the `parseyaml` function with the ruby .to_yaml function in a template
** Return a more complex data type to puppet

Bonus:
* Perform a complex transformation in the template
* Return a hash
* Return a hash from an array as input

Level 42:
* If you're bored, look at the base64 example in the course outline
** Is this still useful? Why or why not?

Happy hacking!\n",
	}
    file { "/root/baz/":
		ensure => directory,		# make sure this is a directory
		recurse => true,		# recursively manage directory
		purge => true,			# purge all unmanaged files
		force => true,			# also purge subdirs and links
		owner => root, group => nobody, mode => 600, backup => false,
	}

    file { '/root/baz/hello.txt':
         ensure => present,
         content => inline_template('Welcome to <%= @hostname %>'),
     	 require => File["/root/baz/"],
    }

    $group_data_list = ['1=one', '2=two', '3=three', '4=four']
    $group_data_yaml = inline_template("<%= @group_data_list.inject(Hash.new) { |h,i| { '${volume}#'+((i.split('=').length == 2) ? i.split('=')[0] : '') => {'message' => ((i.split('=').length == 2) ? i.split('=')[1] : '')} }.merge(h) }.to_yaml %>")
	# build into a hash
	$group_data_hash = parseyaml($group_data_yaml)
    create_resources(notify, $group_data_hash)
}

# vim: ts=8
