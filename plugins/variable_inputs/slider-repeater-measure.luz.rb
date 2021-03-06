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

class VariableInputSliderLooperMeasure < VariableInput
	title				"Slider Looper Measure"
	description "Records named slider for the duration of a measure, then repeats for future measures."

	setting 'slider', :slider, :summary => true
	setting 'record', :button
	setting 'number_of_measures', :integer, :range => 1..100, :default => 1..2

	def value
		if $engine.button_pressed_this_frame?(record)
			#
			# Begin Recording
			#
			@recording = true
			@record_next_measure = false
			@starting_measure = $env[:measure]
			@starting_measure_scale = $env[:measure_scale]
			@samples = Array.new
		end

		if @recording
			@samples << slider

			if $env[:measure] > (@starting_measure + number_of_measures)
				#
				# End Recording
				#
				@recording = false
			end

			return @samples.last		# Pass-through the current value

		else
			#
			# Not recording current value
			#
			if @samples
				progress = ($env[:measure_scale] + @starting_measure_scale) % 1.0
				return @samples[(progress * (@samples.size - 1)).floor]
			else
				slider
			end
		end
	end
end
