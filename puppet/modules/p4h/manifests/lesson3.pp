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

class p4h::lesson3() {

	file { '/root/README':
		content => "##lesson3
For this lesson, please do the following:
* Know about the `concat`, `count`, `delete`, `flatten`, `getvar`, `has_key`,
`join`, `keys`, `member`, `merge`, `parseyaml` and `type` functions from stdlib

Bonus:
* Can you think about what `getvar` is useful for ?
* Can you think about what `parseyaml` could be useful for ?

Happy hacking!\n",
	}

	notice (concat(['1','2','3'],['4','5','6']))
    notice (count([5, 3, 10]))
    notice (delete(['a','b','c','b'], 'b'))
    notice (flatten(['a', ['b', ['c']]]))
    $datalocation = 'p4h::name'
    notice (getvar("site::data"))
    $my_hash = {'key_one' => 'value_one'}
    if has_key($my_hash, 'key_two') {
        notice('we will not reach here')
}
}

# vim: ts=8
