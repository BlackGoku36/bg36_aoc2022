const std = @import("std");

fn part1(all_calories: []u32) anyerror!void {
    var calories: u32 = 0;

    for (all_calories) |value| {
        if (value > calories) calories = value;
    }

    std.log.info("Part-1; Calories: {d}", .{calories});
}

fn cmpByValue(context: void, a: u32, b: u32) bool {
    return std.sort.desc(u32)(context, a, b);
}

fn part2(temp_all_calories: []u32) anyerror!void {
    var all_calories: [500]u32 = undefined;
    for (temp_all_calories) |_, index| {
        all_calories[index] = temp_all_calories[index];
    }

    std.sort.sort(u32, all_calories[0..], {}, cmpByValue);

    std.log.info("Part-2; Calories: {d}", .{all_calories[0] + all_calories[1] + all_calories[2]});
}

pub fn main() anyerror!void {
    var all_calories: [500]u32 = undefined;
    for (all_calories) |_, index| {
        all_calories[index] = 0;
    }

    var file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var calorie: u32 = 0;
    var buffer: [2000]u8 = undefined;

    var i: u32 = 0;
    while (try file.reader().readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var value = std.fmt.parseInt(u32, line, 10) catch {
            all_calories[i] = calorie;
            calorie = 0;
            i += 1;
            continue;
        };
        calorie += value;
    }

    try part1(&all_calories);
    try part2(&all_calories);
}
