module ApplicationHelper

	def display_sizes(size)
		size_index = {s: 1, m: 2, l: 3, xl: 4}
		size.split(',').map(&:strip).sort! { |x, y| size_index[x.to_sym] <=> size_index[y.to_sym] }.join(", ")
	end

end
