var CHART_HELPER = function() {
    require.config({
        paths: {
            'echarts': '../../assets/global/plugins/vendors/echart',
            'echarts/theme/jmb': '../../assets/global/plugins/vendors/echart/themes/jmb',
            'echarts/chart/line': '../../assets/global/plugins/vendors/echart/charts/line',
            'echarts/chart/pie': '../../assets/global/plugins/vendors/echart/charts/pie',
            'echarts/chart/bar': '../../assets/global/plugins/vendors/echart/charts/bar'
        }
    });
    return {
        drawLineChart: function(el, data, legend, xAxis) {
            var series = [],
                isShowLegend = false;
            if (legend.length > 1) {
                isShowLegend = true;
            }
            for (var i = 0; i < data.length; i++) {
                series.push({
                    name: legend[i],
                    type: 'line',
                    itemStyle: {
                        normal: {
                            areaStyle: {
                                type: 'default'
                            }
                        }
                    },
                    data: data[i]
                });
            }
            var option = {
                tooltip: {
                    trigger: 'axis',
                    formatter: function(params) {
                        return (params[0].name)+'时交易额：' + (params[0].value).toFixed(2) + '元';
                    }
                },
                legend: {
                    show: isShowLegend,
                    data: legend
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    boundaryGap: false,
                    data: xAxis
                }],
                yAxis: [{
                    type: 'value',
                    axisLabel: {
                        formatter: function(value) {
                            return (value) + '元';
                        }
                    }
                }],
                series: series
            };
            require(
                ['echarts', 'echarts/theme/jmb', 'echarts/chart/line'], function(ec, theme) {
                    var chart = ec.init(el, theme);
                    chart.setOption(option);
                });
        },
        drawBarChart: function(el, data, legend, xAxis) {
            var series = [],
                isShowLegend = false;
            if (legend.length > 1) {
                isShowLegend = true;
            }
            for (var i = 0; i < data.length; i++) {
                series.push({
                    name: legend[i],
                    type: 'bar',
                    stack: 'sum',
                    itemStyle: {
                        normal: {
                            barBorderRadius: 0,
                            label: {
                                show: false
                            }
                        }
                    },
                    data: data[i]
                });
            }
            var option = {
                tooltip: {
                    trigger: 'axis',
                    axisPointer: { // 坐标轴指示器，坐标轴触发有效
                        type: 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                    },
                    formatter: function(params) {
                        return params[0].name + '<br/>交易额：' + (params[0].value / 10000).toFixed(2) + '万';
                    }
                },
                legend: {
                    orient: 'horizontal',
                    x: 'center',
                    y: 'top',
                    selectedMode: false,
                    data: legend
                },
                calculable: true,
                xAxis: [{
                    type: 'category',
                    data: xAxis
                }],
                yAxis: [{
                    type: 'value',
                    axisLabel: {
                        formatter: function(value) {
                            return parseFloat(value / 100000000).toFixed(2) + "亿"
                        }
                    }
                }],
                series: series
            };
            require(
                ['echarts', 'echarts/theme/jmb', 'echarts/chart/bar'], function(ec, theme) {
                    var chart = ec.init(el, theme);
                    chart.setOption(option);
                });
        },
        drawPieChart: function(el, data) {
            var dataArray = [],
                other = 0;
            if(data.length > 6){
                for (var i = 0; i < data.length; i++) {
                    if (i < 5) {
                        dataArray.push(data[i]);
                    } else {
                        other += parseFloat(data[i].value);
                        if (i === data.length - 1) {
                            dataArray.push({
                                'name': '其他',
                                'value': other
                            });
                        }
                    }
                }
            }else{
                dataArray = data;
            }
            var legend = [];
            for (var i = 0; i < dataArray.length; i++) {
                legend.push(dataArray[i]);
            }
            var option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{b} : {d}%"
                },
                legend: {
                    orient: 'vertical',
                    x: 'right',
                    data: legend
                },
                calculable: true,
                series: [{
                    name: '访问来源',
                    type: 'pie',
                    radius: ['60%', '90%'],
                    center: ['40%', '50%'],
                    itemStyle: {
                        normal: {
                            label: {
                                show: false
                            },
                            labelLine: {
                                show: false
                            }
                        },
                        emphasis: {
                            label: {
                                show: false
                            }
                        }
                    },
                    data: dataArray
                }]
            };
            require(
                ['echarts', 'echarts/theme/jmb', 'echarts/chart/pie'], function(ec, theme) {
                    var chart = ec.init(el, theme);
                    chart.setOption(option);
                });
        },
        drawMatrixPieChart: function(el, data1, data2) {
            var legend = [];
            for (var i = 0; i < data2.length; i++) {
                legend.push(data2[i].name);
            }
            var option = {
                tooltip: {
                    trigger: 'item',
                    formatter: "{b} : {d}%"
                },
                legend: {
                    orient: 'vertical',
                    x: 'right',
                    data: legend
                },
                calculable: false,
                series: [{
                    type: 'pie',
                    selectedMode: 'single',
                    radius: [0, '50%'],
                    center: ['40%', '50%'],
                    itemStyle: {
                        normal: {
                            label: {
                                position: 'inner'
                            },
                            labelLine: {
                                show: false
                            }
                        }
                    },
                    data: data1
                }, {
                    type: 'pie',
                    radius: ['60%', '90%'],
                    center: ['40%', '50%'],
                    itemStyle: {
                        normal: {
                            label: {
                                show: false
                            },
                            labelLine: {
                                show: false
                            }
                        },
                        emphasis: {
                            label: {
                                show: false
                            }
                        }
                    },
                    data: data2
                }]
            };
            require(
                ['echarts', 'echarts/theme/jmb', 'echarts/chart/pie'], function(ec, theme) {
                    var chart = ec.init(el, theme);
                    chart.setOption(option);
                });
        },
    };
}();