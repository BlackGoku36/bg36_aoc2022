const std = @import("std");

fn part1() anyerror!void {
    var buffer: [2000]u8 = undefined;
    var file = try std.fs.cwd().openFile("input.txt", .{});

    var sum_of_priorities: u32 = 0;

    var map_lower: [26]u8 = undefined;
    var map_upper: [26]u8 = undefined;

    while (try file.reader().readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        var len: usize = std.mem.len(line);
        var half_len: u32 = @floatToInt(u32, @intToFloat(f32, len) / 2.0);

        var i: u32 = 0;
        while (i < half_len) : (i += 1) {
            if (std.ascii.isUpper(line[i])) {
                map_upper[line[i] - 65] = line[i];
            } else {
                map_lower[line[i] - 97] = line[i];
            }
        }

        var char: u8 = undefined;

        var j: u32 = half_len;
        while (j < len) : (j += 1) {
            if (std.ascii.isUpper(line[j])) {
                if (map_upper[line[j] - 65] == line[j]) char = line[j];
            } else {
                if (map_lower[line[j] - 97] == line[j]) char = line[j];
            }
        }

        if (std.ascii.isUpper(char)) {
            sum_of_priorities += char - 38;
        } else {
            sum_of_priorities += char - 96;
        }

        for (map_lower) |_, index| {
            map_lower[index] = 0;
        }
        for (map_upper) |_, index| {
            map_upper[index] = 0;
        }
    }
    std.debug.print("Part-1 Sum: {d}\n", .{sum_of_priorities});
}

const group = struct {
    line1: [50]u8,
    line2: [50]u8,
    line3: [50]u8,
};

fn part2() anyerror!void {
    var buffer: [2000]u8 = undefined;
    var file = try std.fs.cwd().openFile("input.txt", .{});

    var i: u32 = 0;
    var j: u32 = 0;

    var lines: [100]group = undefined;

    while (try file.reader().readUntilDelimiterOrEof(&buffer, '\n')) |line| {
        if (j == 0) {
            for (line) |value, index| {
                lines[i].line1[index] = value;
            }
        } else if (j == 1) {
            for (line) |value, index| {
                lines[i].line2[index] = value;
            }
        } else if (j == 2) {
            for (line) |value, index| {
                lines[i].line3[index] = value;
            }
        }
        j += 1;
        if (j == 3) {
            j = 0;
            i += 1;
        }
    }

    var f: bool = false;
    var sum: u32 = 0;
    for (lines) |value| {
        if (f) f = false;
        for (value.line1) |line1_c| {
            if (f) break;
            for (value.line2) |line2_c| {
                if (f) break;
                for (value.line3) |line3_c| {
                    if (f) break;
                    if (std.ascii.isAlphabetic(line1_c) and std.ascii.isAlphabetic(line2_c) and std.ascii.isAlphabetic(line3_c)) {
                        if (line1_c == line2_c and line2_c == line3_c) {
                            f = true;
                            if (std.ascii.isUpper(line1_c)) {
                                sum += line1_c - 38;
                            } else {
                                sum += line1_c - 96;
                            }
                        }
                    }
                }
            }
        }
    }
    std.debug.print("Part-2 Sum: {d}\n", .{sum});
}

pub fn main() anyerror!void {
    try part1();
    try part2();
}
