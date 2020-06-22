function result = absSquared(target, query)
    diff = target - query;
    result = sum(diff.^2);
end