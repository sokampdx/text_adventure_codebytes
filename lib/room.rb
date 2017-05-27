class Room
	attr_reader :entrance, :exit, :interaction

	def initialize(options = { })
		@options = options
		@size = @options[:size] || 1
		@entrance = @options[:entrance] || [0,0]
		@exit = @options[:exit]
		@interaction = @options[:interaction] || nil
		@map = Array.new(@size){Array.new(@size)}
	end	

	def populate
		{ :entrance => @entrance, :exit => @exit }.merge(@interaction).each do |key, value|
			@map[value[0], value[1]] = key.to_s
		end
	end

	def can_move_to?(x, y)
		@map[x][y].nil?
	end

	def interact?(object)
		!@interaction.nil? && !@interaction[object.to_sym].nil?
	end
end

class CrazyRoom < Room
	def initialize(options = { size: 4 })
		super(options)
	end

end

