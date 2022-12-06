const std = @import("std");

const input = @embedFile("input.txt");

pub fn checkRepeated(string: []const u8) bool {
    var len = std.mem.len(string);
    var x: u32 = 0;
    var y: u32 = 0;
    var f: bool = false;
    while (x < len) : (x += 1) {
        while (y < len) : (y += 1) {
            if (string[x] == string[y] and x != y) {
                f = true;
            }
        }
        y = 0;
    }
    x = 0;
    return f;
}

pub fn main() anyerror!void {
    var i: u32 = 0;
    while (i < std.mem.len(input) - 4) : (i += 1) {
        if (!checkRepeated(input[i..(i + 4)])) {
            break;
        }
    }
    std.debug.print("First marker: {d}\n", .{i + 4});

    var j: u32 = 0;
    while (j < std.mem.len(input) - 14) : (j += 1) {
        if (!checkRepeated(input[j..(j + 14)])) {
            break;
        }
    }
    std.debug.print("Message marker: {d}\n", .{j + 14});
}
