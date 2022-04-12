## 使用機器學習方法預測信用卡的違約支付
---
## 實現內容
- 以台灣公開信用卡資料集，其中包括持卡人年紀、性別、教育程度、婚姻狀況、信用卡還款狀況與信用卡帳單金額，首先探討信用卡違約支付的情形，之後利用機器學習方法來訓練資料建立模型，預測此持卡人未來是否會發生信用卡違約支付的情況。
- 目標是預測持卡人是否會發生信用卡違約支付的情況，利用傳統機器學習方法SVM(Support Vector Machines)，建立訓練、驗證與測試資料集，針對訓練資料集，取得重要特徵值，做模型訓練、評估、預測。
## 使用資料集
國家高速網路與計算中心首頁 -> 組織 -> UCI Machine Learning Repository -> default of credit card clients
link:https://scidm.nchc.org.tw/dataset/default-of-credit-card-clients
## 資料預處理與訓練模型使用資料集
- 原始資料集正樣本與負樣本比例分配不均，下一個月沒有違約的資料占了八成，資料預處理是刪除正樣本數平衡正負樣本，刪除相對不重要之特徵值。
- 訓練模型使用的資料集，包括一千筆持卡人的資料，每個持卡人包含六個特徵值分別是信用額度、性別、教育程度、婚姻、年齡、上個月的繳款狀況。
## SVM原理說明
- SVM模型是將實例表示為空間中的點，假設給定的資料各自屬於兩個類別之一，目的是要尋找一條線或平面將實例分為兩類且兩類之間距離分隔最大。
- SVM可以處理非線性分割，處理上主要是改變資料的維度，以及加入轉換函數與核技巧的概念。
## 實現方法與結果
- 使用MATLAB的內建函數FITCSVM訓練然後預測下個月是否違約支付。FITCSVM這個函數可以自動最佳化參數，來決定模型使用的所有參數包括核函數、約束框等。
- 準確率為0.7067
## 檔案說明
- [x] Credit_Card.csv 為原始信用卡資料集
- [x] credit_card_1000.csv 為訓練模型輸入讀取檔案（資料預處理）
- [x] Ex_ClassificationSVM.m 為訓練模型MATLAB主程式碼，需要讀取credit_card_1000.csv檔案
- [x] trainedSVMmodel_0.70.mat 為訓練後儲存的模型檔案，模型準確率為0.7067
## Reference
https://ww2.mathworks.cn/help/stats/fitcsvm.html
https://www.ym.edu.tw/~cflu/MatlabML_Class08_CFLu.pdf
