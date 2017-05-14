function [ sec ] = time_fixer( seconds, weeks, cycle)

sec = seconds + (604800*weeks) + (1024*cycle*604800);

end

