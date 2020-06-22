function result = canbberaDist(target, query)
    diff = target - query;
    result = abs(diff)/(abs(target) + abs(query));
end