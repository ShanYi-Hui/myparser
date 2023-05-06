const peg = require("pegjs");
const fs = require("fs");

// 读取DSL文件
const input = fs.readFileSync("input.dsl", "utf-8");

// 读取文法文件
const grammar = fs.readFileSync("grammar.pegjs", "utf-8");

// 编译文法
const parser = peg.generate(grammar);

// 解析DSL并生成目标代码
const result = parser.parse(input);

console.dir(result);
