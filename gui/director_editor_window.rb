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

require 'parent_user_object_editor_window'
require 'director_treeview', 'effect_treeview', 'user_object_settings_editor'
require 'add_director_effect_window'

class DirectorEditorWindow < ParentUserObjectEditorWindowWithDialogs
	alias :selected_directors :selected_parents

	alias :add_director_class :add_parent_class
	alias :add_director_effect_class :add_child_class

	def initialize
		super('user_object_editor_window',
			Director, DirectorTreeView, UserObjectSettingsEditor, nil,
			DirectorEffect, EffectTreeView, UserObjectSettingsEditor, AddDirectorEffectWindow,
			$gui.director_tag_model)

		@parent_treeview.model = $gui.director_model
	end

private

	def on_parent_list_changed
		$engine.project.directors = @parent_treeview.objects
	end
end
