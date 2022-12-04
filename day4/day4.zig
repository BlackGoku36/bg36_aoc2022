const std = @import("std");

const input = @embedFile("input.txt");

pub fn part1() anyerror!void{
    var lines = std.mem.tokenize(u8, input, "\n");
    var count: u32 = 0;
    while(lines.next()) |line|{
        var pairs = std.mem.tokenize(u8, line, ",");

        var pair1 = pairs.next().?;
        var pair1_range = std.mem.tokenize(u8, pair1, "-");
        var pair1_start:u8 = try std.fmt.parseInt(u8, pair1_range.next().?, 10);
        var pair1_end:u8 = try std.fmt.parseInt(u8, pair1_range.next().?, 10);

        var pair2 = pairs.next().?;
        var pair2_range = std.mem.tokenize(u8, pair2, "-");
        var pair2_start:u8 = try std.fmt.parseInt(u8, pair2_range.next().?, 10);
        var pair2_end:u8 = try std.fmt.parseInt(u8, pair2_range.next().?, 10);

        if(pair1_start >= pair2_start and pair1_end <= pair2_end){
            count += 1;
        }else if(pair2_start >= pair1_start and pair2_end <= pair1_end){
            count+=1;
        }
    }
    std.debug.print("Count: {d}\n", .{count});
}

pub fn part2() anyerror!void{
    var lines = std.mem.tokenize(u8, input, "\n");
    var count: u32 = 0;
    while(lines.next()) |line|{
        var pairs = std.mem.tokenize(u8, line, ",");

        var pair1 = pairs.next().?;
        var pair1_range = std.mem.tokenize(u8, pair1, "-");
        var pair1_start:u8 = try std.fmt.parseInt(u8, pair1_range.next().?, 10);
        var pair1_end:u8 = try std.fmt.parseInt(u8, pair1_range.next().?, 10);

        var pair2 = pairs.next().?;
        var pair2_range = std.mem.tokenize(u8, pair2, "-");
        var pair2_start:u8 = try std.fmt.parseInt(u8, pair2_range.next().?, 10);
        var pair2_end:u8 = try std.fmt.parseInt(u8, pair2_range.next().?, 10);

        if(pair2_start <= pair1_end and pair2_end >= pair1_start){
            count += 1;
        }
    }
    std.debug.print("Count: {d}\n", .{ count});
}

pub fn main() anyerror!void{
    try part1();
    try part2();
}