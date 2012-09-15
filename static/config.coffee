config =
    isps:
        0: '电 信'
        1: '联 通'
        2: '移 动'
        3: '教育网'
    
    dict_monitor_id:
        1: 'Guangdong'
        2: 'Guangdong'
        3: 'Guangdong'
        4: 'Shaanxi'
        5: 'Shaanxi'
        6: 'Shaanxi'
        7: 'Zhejiang'
        8: 'Zhejiang'
        9: 'Zhejiang'
        10: 'Zhejiang'
        11: 'Shanghai'
        12: 'Shanghai'
        13: 'Shanghai'
        14: 'Shandong'
        15: 'Tianjin'
        16: 'Tianjin'
        17: 'Sichuan'
        18: 'Jiangsu'

    monitor_points:
        1: "广东东莞电信"
        2: "广东深圳联通"
        3: "广东深圳电信"
        4: "陕西汉中联通"
        5: "陕西西安电信"
        6: "陕西西安教育网"
        7: "浙江杭州教育网"
        8: "浙江杭州联通"
        9: "浙江杭州电信"
        10: "浙江杭州电信"
        11: "上海电信"
        12: "上海移动"
        13: "上海联通"
        14: "山东济南联通"
        15: "天津电信"
        16: "天津联通"
        17: "四川成都联通"
        18: "江苏南京电信"

    down_msgs:
        '24': '504 网关超时'
        '22': '502 网关错误'
        '31': '没有到主机的路由'
        '20': '500 内部错误'
        '30': '连接被拒绝'
        '23': '503 服务不可用'
        '29': '连接被重置'
        '28': '本地DNS解析失败'
        '27': '连接超时'

# export config to module export or window
(exports ? this).config = config
