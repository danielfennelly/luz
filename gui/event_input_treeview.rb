 ###############################################################################
 #  Copyright 2006 Ian McIntosh <ian@openanswers.org>
 #
 #  This program is free software; you can redistribute it and/or modify
 #  it under the terms of the GNU General Public License as published by
 #  the Free Software Foundation; either version 2 of the License, or
 #  (at your option) any later version.
 #
 #  This program is distributed in the hope that it will be useful,
 #  but WITHOUT ANY WARRANTY; without even the implied warranty of
 #  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #  GNU Library General Public License for more details.
 #
 #  You should have received a copy of the GNU General Public License
 #  along with this program; if not, write to the Free Software
 #  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 ###############################################################################

require 'child_treeview', 'event_input_liststore'

class EventInputTreeView < ChildTreeView
	options :model_class => EventInputListStore
	#column :progress, :renderers => [{:name => :progress, :type => :progress, :model_column => :progress}], :expand => false, :position => 1
	#column :count, :renderers => [{:name => :count, :type => :text, :model_column => :count}], :expand => false, :position => 1
	column :changed, :renderers => [{:name => :changed, :type => :markup, :model_column => :changed}], :expand => false, :position => 1
end
