#!/usr/bin/awk -f
#
# FTdna_to_23andme.awk - Converts Family Tree DNA format to 23AndMe format
# Copyright (C) 2017 Philip Baltar (psbaltar@gmail.com)
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#
# FTdna_to_23andme.awk [inputfile] > [outputfile]


BEGIN {print "# converted to 23andme format using FTdna_to_23andme.awk\n#\n#"; FS=","}
$1~"^#" {print; next}
$1~"^RSID" {print "# rsid\tchromosome\tposition\tgenotype"; next}
{gsub(/"/, ""); gsub(/\r/, ""); print $1 "\t" $2 "\t" $3 "\t" $4}
