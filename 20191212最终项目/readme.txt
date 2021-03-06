//感谢使用该程序，该程序由“生物医学信号处理综合实验侯睿哲、冉云聪、欧恒悦小组”提供
在正式运行程序前，请先阅读：
--------------------------------------------------------------------------------------------------------------------
程序简介：       MATLAB实现示波器、信号发生器和数字输入输出的一体化的程序
    程序的用途：选择实现模拟信号示波、发生模拟信号并输出，输出数字信号方波，检测输入数字信号并生成方波。
    实现的功能：1. 在主界面上选择功能模块，点击打开模块界面。
                       2. 示波器：
                       ①使用不同采样率对AI0-3输入的信号进行采集显示，动态调整时间轴和电压轴缩放，滑动条拖动显示波形，可以获取坐标。
                       ②对采集到的信号进行保存到文件，也可导入信号数据，展示在屏幕上。
                       ③选取某一通道的采集信号进行低通、高通滤波以及FFT。
                       3. 信号发生器：
                       ①根据选择的信号类型及相关参数来生成输出信号的波形。
                       ②根据导入文件的信号数据或者自定义的函数信号来生成输出信号的波形。
                       ③信号的输出有“开始”、"暂停”和“停止”三个控制按钮，可以选择输出周期或者连续输出。
                       4. DO和DI
                       ①在1-50Hz中选择频率，输出方波。方波可以选择定时输出和连续输出，有“开始”、"暂停”和“停止”三个控制按钮进行控制。
                       ②检测DI的输入，将输入的八位二进制数换算方波的幅度频率以及对方波生成的控制位，如果控制位显示开始，那么生成方波显示在屏幕上。
---------------------------------------------------------------------------------------------------------------------
程序的使用说明：
    使用环境：1. 程序请使用MATLAB（建议版本2018a,其余版本可能会造成GUI界面出错）
                    2. exe文件请在64位系统中运行
    程序运行：1. 使用matlab 2018a运行Integrate_HOR.m文件（exe请双击点开Integrate_HOR.exe）
                    2. 选择所需要的功能模块，单击。
                    3. 示波器：
                    ①输入采样率，选择通道，点击“开始采集”，可动态调整时间轴和电压轴缩放。
                    ②点击“停止采集”，滑动条拖动显示波形，点击“获取坐标”即可进行波形上的坐标获取。
                    ③点击“保存信号数据”，对采集到的信号进行保存到文件
                    ④点击“导入信号数据”，文件里的信号展示在屏幕上。
                    ⑤选取某一通道的采集信号，选择滤波或者FFT， 若选择滤波，请选择高通和低通并输入截止频率，然后点击“确认处理”。
                    ⑥结束后关闭页面即可回到主界面。
                    4. 信号发生器：
                    ①选择信号类型，输入相关参数，相对应的输出信号的波形显示在预览框中。
                    ②或者点击“文件导入数据”，根据导入文件的信号数据生成输出信号的波形，显示在预览框中。
                    ③或者点击“自定义函数”，在输入框中按照matlab的函数格式输入函数，输入相关参数，点击“确定”，波形显示在预览框中。
                    ④选择输出模式，点击“开始”，信号开始输出，点击"暂停”或“停止”可以控制输出状态。
                    ⑤结束后关闭页面即可回到主界面。
                    5. DO和DI
                    ①在1-50Hz中选择频率，选择定时输出或连续输出，点击“开始”，信号开始输出，点击"暂停”或“停止”可以控制输出状态。
                    ②自动检测DI的输入，可以得到输入的二进制数和换算后的控制位、幅度和频率值，如果控制位显示开始，那么生成方波显示在屏幕上。
                    ③结束后关闭页面即可回到主界面。
--------------------------------------------------------------------------------------------------------------------------------
注意事项：1. 示波器最高可以可以达到的采样率为100Hz，单通道输入效果好于多通道输入。
                2. 因为timer运行的时间较长、频率有限，输出信号的频率和周期点数的乘积最大为300Hz，请不要超过此数字。
                3. 导入文件数据请注意文件格式的规范，应有一份数据文件和对应的一份info文件。可以先保存文件来参考格式。

致谢：感谢吉翔老师对于此程序实现给予的帮助和支持

感谢您的使用，祝您使用愉快！
