const std = @import("std");

const ArrayList = std.ArrayList;

const input = @embedFile("input.txt");

pub fn part1(allocator: std.mem.Allocator) anyerror!void {
    var stack1 = ArrayList(u8).init(allocator);
    var stack2 = ArrayList(u8).init(allocator);
    var stack3 = ArrayList(u8).init(allocator);
    var stack4 = ArrayList(u8).init(allocator);
    var stack5 = ArrayList(u8).init(allocator);
    var stack6 = ArrayList(u8).init(allocator);
    var stack7 = ArrayList(u8).init(allocator);
    var stack8 = ArrayList(u8).init(allocator);
    var stack9 = ArrayList(u8).init(allocator);

    var stack1_arr = [_]u8{ 'R', 'N', 'P', 'G' };
    try stack1.appendSlice(stack1_arr[0..]);

    var stack2_arr = [_]u8{ 'T', 'J', 'B', 'L', 'C', 'S', 'V', 'H' };
    try stack2.appendSlice(stack2_arr[0..]);

    var stack3_arr = [_]u8{ 'T', 'D', 'B', 'M', 'N', 'L' };
    try stack3.appendSlice(stack3_arr[0..]);

    var stack4_arr = [_]u8{ 'R', 'V', 'P', 'S', 'B' };
    try stack4.appendSlice(stack4_arr[0..]);

    var stack5_arr = [_]u8{ 'G', 'C', 'Q', 'S', 'W', 'M', 'V', 'H' };
    try stack5.appendSlice(stack5_arr[0..]);

    var stack6_arr = [_]u8{ 'W', 'Q', 'S', 'C', 'D', 'B', 'J' };
    try stack6.appendSlice(stack6_arr[0..]);

    var stack7_arr = [_]u8{ 'F', 'Q', 'L' };
    try stack7.appendSlice(stack7_arr[0..]);

    var stack8_arr = [_]u8{ 'W', 'M', 'H', 'T', 'D', 'L', 'F', 'V' };
    try stack8.appendSlice(stack8_arr[0..]);

    var stack9_arr = [_]u8{ 'L', 'P', 'B', 'V', 'M', 'J', 'F' };
    try stack9.appendSlice(stack9_arr[0..]);

    var stacks = [_]ArrayList(u8){ stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9 };

    var lines = std.mem.tokenize(u8, input, "\n");

    while (lines.next()) |line| {
        var words = std.mem.tokenize(u8, line, " ");

        _ = words.next().?;
        var quantity: u32 = try std.fmt.parseInt(u32, words.next().?, 10);
        _ = words.next().?;
        var from: u32 = try std.fmt.parseInt(u32, words.next().?, 10);
        _ = words.next().?;
        var to: u32 = try std.fmt.parseInt(u32, words.next().?, 10);

        var i: u32 = 0;
        while (i < quantity) : (i += 1) {
            var c = stacks[from - 1].pop();
            try stacks[to - 1].append(c);
        }
    }
    std.debug.print("Part-1: {c}{c}{c}{c}{c}{c}{c}{c}{c}\n", .{
        stacks[0].pop(), stacks[1].pop(), stacks[2].pop(),
        stacks[3].pop(), stacks[4].pop(), stacks[5].pop(),
        stacks[6].pop(), stacks[7].pop(), stacks[8].pop(),
    });
}

pub fn part2(allocator: std.mem.Allocator) anyerror!void {
    var stack1 = ArrayList(u8).init(allocator);
    var stack2 = ArrayList(u8).init(allocator);
    var stack3 = ArrayList(u8).init(allocator);
    var stack4 = ArrayList(u8).init(allocator);
    var stack5 = ArrayList(u8).init(allocator);
    var stack6 = ArrayList(u8).init(allocator);
    var stack7 = ArrayList(u8).init(allocator);
    var stack8 = ArrayList(u8).init(allocator);
    var stack9 = ArrayList(u8).init(allocator);

    var stack1_arr = [_]u8{ 'R', 'N', 'P', 'G' };
    try stack1.appendSlice(stack1_arr[0..]);

    var stack2_arr = [_]u8{ 'T', 'J', 'B', 'L', 'C', 'S', 'V', 'H' };
    try stack2.appendSlice(stack2_arr[0..]);

    var stack3_arr = [_]u8{ 'T', 'D', 'B', 'M', 'N', 'L' };
    try stack3.appendSlice(stack3_arr[0..]);

    var stack4_arr = [_]u8{ 'R', 'V', 'P', 'S', 'B' };
    try stack4.appendSlice(stack4_arr[0..]);

    var stack5_arr = [_]u8{ 'G', 'C', 'Q', 'S', 'W', 'M', 'V', 'H' };
    try stack5.appendSlice(stack5_arr[0..]);

    var stack6_arr = [_]u8{ 'W', 'Q', 'S', 'C', 'D', 'B', 'J' };
    try stack6.appendSlice(stack6_arr[0..]);

    var stack7_arr = [_]u8{ 'F', 'Q', 'L' };
    try stack7.appendSlice(stack7_arr[0..]);

    var stack8_arr = [_]u8{ 'W', 'M', 'H', 'T', 'D', 'L', 'F', 'V' };
    try stack8.appendSlice(stack8_arr[0..]);

    var stack9_arr = [_]u8{ 'L', 'P', 'B', 'V', 'M', 'J', 'F' };
    try stack9.appendSlice(stack9_arr[0..]);

    var stacks = [_]ArrayList(u8){ stack1, stack2, stack3, stack4, stack5, stack6, stack7, stack8, stack9 };

    var lines = std.mem.tokenize(u8, input, "\n");

    while (lines.next()) |line| {
        var words = std.mem.tokenize(u8, line, " ");

        _ = words.next().?;
        var quantity: u32 = try std.fmt.parseInt(u32, words.next().?, 10);
        _ = words.next().?;
        var from: u32 = try std.fmt.parseInt(u32, words.next().?, 10);
        _ = words.next().?;
        var to: u32 = try std.fmt.parseInt(u32, words.next().?, 10);

        var temp_stack = ArrayList(u8).init(allocator);

        var i: u32 = 0;
        while (i < quantity) : (i += 1) {
            var c = stacks[from - 1].pop();
            try temp_stack.append(c);
        }

        var j: u32 = 0;
        while (j < quantity) : (j += 1) {
            var c = temp_stack.pop();
            try stacks[to - 1].append(c);
        }
    }
    std.debug.print("Part-2: {c}{c}{c}{c}{c}{c}{c}{c}{c}\n", .{
        stacks[0].pop(), stacks[1].pop(), stacks[2].pop(),
        stacks[3].pop(), stacks[4].pop(), stacks[5].pop(),
        stacks[6].pop(), stacks[7].pop(), stacks[8].pop(),
    });
}

pub fn main() anyerror!void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    defer arena.deinit();

    const allocator = arena.allocator();
    try part1(allocator);
    try part2(allocator);
}
