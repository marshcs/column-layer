function [shift_data] = barrel_shifter(data,offset)
% data		D1 * D2
% ofsset	1 * D2;

[D1,D2]	= size(data);

shift_data = data;

for d2 = 1:D2
	if offset(1,d2) > 0
		shift_data(1:D1-offset(1,d2),d2) = data(offset(1,d2):D1,d2);
		shift_data(D1-offset(1,d2):D1,d2) = data(1:offset(1,d2),d2);
	else
		shift_data(:,d2) = data(:,d2);
	end
end

end