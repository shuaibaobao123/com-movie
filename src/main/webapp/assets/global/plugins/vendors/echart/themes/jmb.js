define(function() {

var theme = {
    // 默认色板
    color: [
        '#4fc1e9', '#f89135', '#f8585b', '#ffdc89', '#66cc66', '#596373'
    ],

    // 图表标题
    title: {
        itemGap: 8,
        textStyle: {
            fontWeight: 'normal',
            color: '#008acd'          // 主标题文字颜色
        }
    },
    
    // 图例
    legend: {
        itemGap: 8
    },
    
    // 值域
    dataRange: {
        itemWidth : 15,
        color:['#3bafda','#dbf4ff'],
        //color : ['#5ab1ef','#2ec7c9','#b6a2de'],
        textStyle: {
            color: '#999'          // 值域文字颜色
        }
    },

    toolbox: {
        color : ['#1e90ff', '#1e90ff', '#1e90ff', '#1e90ff'],
        effectiveColor : '#ff4500',
        itemGap: 8
    },

    // 提示框
    tooltip: { 
        trigger: 'axis',           // 触发类型，默认数据触发，见下图，可选为：'item' ¦ 'axis'
        showDelay: 20,             // 显示延迟，添加显示延迟可以避免频繁切换，单位ms
        hideDelay: 100,            // 隐藏延迟，单位ms
        transitionDuration : 0.4,  // 动画变换时间，单位s
        backgroundColor: 'rgba(0,0,0,0.7)',     // 提示背景颜色，默认为透明度为0.7的黑色
        borderColor: '#333',       // 提示边框颜色
        borderRadius: 4,           // 提示边框圆角，单位px，默认为4
        borderWidth: 0,            // 提示边框线宽，单位px，默认为0（无边框）
        padding: 10,                // 提示内边距，单位px，默认各方向内边距为5，
        
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'line',         // 默认为直线，可选为：'line' | 'shadow'
            lineStyle : {          // 直线指示器样式设置
                color: '#eee'
            },
            crossStyle: {
                color: '#008acd'
            },
            shadowStyle : {                     // 阴影指示器样式设置
                color: 'rgba(200,200,200,0.2)'
            }
        },
        borderColor: '#eee'
    },

    // 区域缩放控制器
    dataZoom: {
        dataBackgroundColor: '#efefff',            // 数据背景颜色
        fillerColor: 'rgba(182,162,222,0.2)',   // 填充颜色
        handleColor: '#008acd'    // 手柄颜色
    },

    // 网格
    grid: {
        borderWidth: 1,
        borderColor: '#eee',
        x: 60,
        y: 10,
        x2: 10,
        y2: 25
    },

    // 类目轴
    categoryAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#999',
                width: 1
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    // 数值型坐标轴默认参数
    valueAxis: {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#999',
                width: 1
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.1)','rgba(200,200,200,0.1)']
            }
        },
        splitLine: {           // 分隔线
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: ['#eee']
            }
        }
    },

    polar : {
        axisLine: {            // 坐标轴线
            lineStyle: {       // 属性lineStyle控制线条样式
                color: '#ddd'
            }
        },
        splitArea : {
            show : true,
            areaStyle : {
                color: ['rgba(250,250,250,0.2)','rgba(200,200,200,0.2)']
            }
        },
        splitLine : {
            lineStyle : {
                color : '#ddd'
            }
        }
    },

    timeline : {
        lineStyle : {
            color : '#008acd'
        },
        controlStyle : {
            normal : { color : '#008acd'},
            emphasis : { color : '#008acd'}
        },
        symbol : 'emptyCircle',
        symbolSize : 3
    },

    // 柱形图默认参数
    bar: {
        itemStyle: {
            normal: {
                barBorderRadius: 0
            },
            emphasis: {
                barBorderRadius: 0
            }
        }
    },

    // 折线图默认参数
    line: {
        smooth : true,
        symbol: 'emptyCircle',  // 拐点图形类型
        symbolSize: 3           // 拐点图形大小
    },
    
    // K线图默认参数
    k: {
        itemStyle: {
            normal: {
                color: '#d87a80',       // 阳线填充颜色
                color0: '#2ec7c9',      // 阴线填充颜色
                lineStyle: {
                    width: 1,
                    color: '#d87a80',   // 阳线边框颜色
                    color0: '#2ec7c9'   // 阴线边框颜色
                }
            }
        }
    },
    
    // 散点图默认参数
    scatter: {
        symbol: 'circle',    // 图形类型
        symbolSize: 4        // 图形大小，半宽（半径）参数，当图形为方向或菱形则总宽度为symbolSize * 2
    },

    // 雷达图默认参数
    radar : {
        symbol: 'emptyCircle',    // 图形类型
        symbolSize:3
        //symbol: null,         // 拐点图形类型
        //symbolRotate : null,  // 图形旋转控制
    },

    map: {
        mapType: 'china',   // 各省的mapType暂时都用中文
        mapLocation: {
            x : 'center',
            y : 'center'
            // width    // 自适应
            // height   // 自适应
        },
        showLegendSymbol : true,       // 显示图例颜色标识（系列标识的小圆点），存在legend时生效
        itemStyle: {
            normal: {
                // color: 各异,
                borderColor: '#eee',
                borderWidth: 0,
                areaStyle: {
                    color: '#eee'//rgba(135,206,250,0.8)
                },
                label: {
                    show: true,
                    textStyle: {
                        color: '#666'
                    }
                }
            },
            emphasis: {                 // 也是选中样式
                // color: 各异,
                borderColor: 'rgba(0,0,0,0)',
                borderWidth: 1,
                areaStyle: {
                    color: '#5ab1ef'
                },
                label: {
                    show: false,
                    textStyle: {
                        color: '#fff'
                    }
                }
            }
        }
    },
    
    force : {
        itemStyle: {
            normal: {
                linkStyle : {
                    strokeColor : '#1e90ff'
                }
            }
        }
    },

    chord : {
        padding : 4,
        itemStyle : {
            normal : {
                lineStyle : {
                    width : 1,
                    color : 'rgba(128, 128, 128, 0.5)'
                },
                chordStyle : {
                    lineStyle : {
                        width : 1,
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            },
            emphasis : {
                lineStyle : {
                    width : 1,
                    color : 'rgba(128, 128, 128, 0.5)'
                },
                chordStyle : {
                    lineStyle : {
                        width : 1,
                        color : 'rgba(128, 128, 128, 0.5)'
                    }
                }
            }
        }
    },

    gauge : {
        startAngle: 225,
        endAngle : -45,
        axisLine: {            // 坐标轴线
            show: true,        // 默认显示，属性show控制显示与否
            lineStyle: {       // 属性lineStyle控制线条样式
                color: [[0.2, '#2ec7c9'],[0.8, '#5ab1ef'],[1, '#d87a80']], 
                width: 10
            }
        },
        axisTick: {            // 坐标轴小标记
            splitNumber: 10,   // 每份split细分多少段
            length :15,        // 属性length控制线长
            lineStyle: {       // 属性lineStyle控制线条样式
                color: 'auto'
            }
        },
        axisLabel: {           // 坐标轴文本标签，详见axis.axisLabel
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        },
        splitLine: {           // 分隔线
            length :22,         // 属性length控制线长
            lineStyle: {       // 属性lineStyle（详见lineStyle）控制线条样式
                color: 'auto'
            }
        },
        pointer : {
            width : 5,
            color : 'auto'
        },
        title : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: '#333'
            }
        },
        detail : {
            textStyle: {       // 其余属性默认使用全局文本样式，详见TEXTSTYLE
                color: 'auto'
            }
        }
    },
    
    textStyle: {
        fontFamily: '微软雅黑, Arial, Verdana, sans-serif'
    }
}

    return theme;
});