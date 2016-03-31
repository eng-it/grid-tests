function gridtest
	% GRIDTEST  Demo of matlab code running on the grid.
	feature('numcores')
	ver
	make_pretty_mesh
end

function make_pretty_mesh
	% MAKE_PRETTY_MESH  Show off MATLAB's 3D plotting.
	z = peaks(25);
	h = figure('visible','off');
	%h.GraphicsSmoothing = 'on';
	h.Position = [0, 0, 800, 600];
	m = mesh(z);
	%saveas(h, 'mesh', 'png')
	print('mesh.png', '-dpng');
	close(h)
end
