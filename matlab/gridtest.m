function gridtest
	% GRIDTEST  Demo of matlab code running on the grid.
	feature('numcores')
	ver
	make_pretty_mesh % called from a separate m-file
end
