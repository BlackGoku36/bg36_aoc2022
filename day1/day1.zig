const std = @import("std");

fn part1() anyerror!void {
    var file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var buffer: [2000]u8 = undefined;

    var calories: u32 = 0;
    var temp_cal: u32 = 0;

    while (try file.reader().readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var value = std.fmt.parseInt(u32, line, 10) catch {
            if (temp_cal > calories) calories = temp_cal;
            temp_cal = 0;
            continue;
        };
        temp_cal += value;
    }

    std.log.info("Part-1; Calories: {d}", .{calories});
}

fn cmpByValue(context: void, a: u32, b: u32) bool {
    return std.sort.desc(u32)(context, a, b);
}

fn part2() anyerror!void {
    var file = try std.fs.cwd().openFile("input.txt", .{});
    defer file.close();

    var buffer: [2000]u8 = undefined;

    var all_calories: [500]u32 = undefined;
    for (all_calories) |_, index| {
        all_calories[index] = 0;
    }

    var temp_cal: u32 = 0;
    var i: u32 = 0;

    while (try file.reader().readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var value = std.fmt.parseInt(u32, line, 10) catch {
            all_calories[i] = temp_cal;
            temp_cal = 0;
            i += 1;
            continue;
        };
        temp_cal += value;
    }

    std.sort.sort(u32, all_calories[0..], {}, cmpByValue);

    std.log.info("Part-2; Calories: {d}", .{all_calories[0] + all_calories[1] + all_calories[2]});
}

pub fn main() anyerror!void {
    try part1();
    try part2();
}
