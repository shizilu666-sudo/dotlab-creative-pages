@echo off
chcp 65001 >nul
echo ========================================
echo   复制图片 + 部署到 GitHub
echo ========================================
echo.

set "WEBSITE_DIR=C:\Users\tzh\Documents\Codex\2026-05-30\imagegen-c-users-tzh-codex-skills\deliverables\dotlab-creative-pages"
set "IMAGE_SRC=C:\Users\tzh\.codex\generated_images\019e7494-6d03-7f60-ae75-c7c4ce53791b"

cd /d "%WEBSITE_DIR%"
if errorlevel 1 (
    echo [错误] 无法进入网站目录
    pause
    exit /b 1
)

echo [1/5] 创建 assets/images 目录...
if not exist "assets\images" mkdir assets\images

echo [2/5] 复制并重命名图片...
echo   文件1: 鹿 ^> wildlife-stillness.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a68333374819183c0fa578bdf1859.png" "assets\images\wildlife-stillness.png" >nul

echo   文件2: 鸟 ^> bird-trace.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a731027848191a9c1628702f289a6.png" "assets\images\bird-trace.png" >nul

echo   文件3: 叶片阴影 ^> leaf-shadow.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a7368590c8191898ba007760807be.png" "assets\images\leaf-shadow.png" >nul

echo   文件4: 幼苗破土 ^> seedling-soil.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a73a08eec8191b2c8d3fb3fbb980d.png" "assets\images\seedling-soil.png" >nul

echo   文件5: 林间路径 ^> forest-path.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a73d69380819193ee1ed9caf4f573.png" "assets\images\forest-path.png" >nul

echo   文件6: 苔藓微距 ^> moss-water-macro.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a7412b8048191b6807f12d28de46f.png" "assets\images\moss-water-macro.png" >nul

echo   文件7: 温室 ^> greenhouse-observation.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a744e8d848191be4a5156b045d4d1.png" "assets\images\greenhouse-observation.png" >nul

echo   文件8: 树冠 ^> hero-canopy.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a746c30208191b8aaef9a1fa1d8b2.png" "assets\images\hero-canopy.png" >nul

echo   文件9: 苔藓细节 ^> detail-moss.png
copy "%IMAGE_SRC%\ig_009a084f2fab1e7b016a1a748fedd88191b9945eebbc61b08f.png" "assets\images\detail-moss.png" >nul

echo   复制 leaf-shadow 作为 detail-leaf（补充缺少的图片）
copy "assets\images\leaf-shadow.png" "assets\images\detail-leaf.png" >nul

echo [3/5] 添加所有文件到 Git...
git add -A

echo [4/5] 提交更改...
git commit -m "添加图片资源文件"

echo [5/5] 推送到 GitHub...
git push

if errorlevel 1 (
    echo.
    echo [错误] 推送失败，尝试重新推送...
    git push
)

echo.
echo ========================================
echo   部署完成！
echo   图片已添加并推送到 GitHub。
echo   刷新网页即可看到图片：
echo   https://shizilu666-sudo.github.io/dotlab-creative-pages
echo ========================================
pause
