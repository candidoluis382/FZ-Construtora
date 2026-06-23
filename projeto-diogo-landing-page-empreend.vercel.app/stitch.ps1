$path = "c:\Users\luise\Downloads\FZ Construtora\projeto-diogo-landing-page-empreend.vercel.app\index.html"
$outPath = "c:\Users\luise\Downloads\FZ Construtora\projeto-diogo-landing-page-empreend.vercel.app\design-system.html"
$extraPath = "c:\Users\luise\Downloads\FZ Construtora\projeto-diogo-landing-page-empreend.vercel.app\design-system-body-extra.html"

$lines = Get-Content -Path $path -Raw
$linesArray = $lines -split "`r`n|`n"

$head = $linesArray[0..1126] -join "`n"
$header = $linesArray[1127..1166] -join "`n"
$hero = $linesArray[1169..1281] -join "`n"
$foot = $linesArray[2855..($linesArray.Length - 1)] -join "`n"
$extra = Get-Content -Path $extraPath -Raw

# Replace Header navigation links
$header = $header -replace 'href="#concept"', 'href="#hero"' -replace 'O Empreendimento', 'Hero'
$header = $header -replace 'href="#exclusividade"', 'href="#typography"' -replace 'Exclusividade', 'Typography'
$header = $header -replace 'href="#hangar"', 'href="#colors"' -replace 'Hangar Privativo', 'Colors'
$header = $header -replace 'href="#implantacao"', 'href="#components"' -replace 'Implantação', 'Components'
$header = $header -replace 'href="#disponibilidade"', 'href="#layout"' -replace 'Disponibilidade', 'Layout'

# Modify Hero content specifically
$hero = $hero -replace 'Onde o mar encontra o</div><div class="line" .*?>luxo e a exclusividade</div>', 'Design System</div><div class="line" style="display: block; text-align: left; width: 100%; overflow: hidden; vertical-align: bottom; translate: none; rotate: none; scale: none; opacity: 1; transform: translate(0px, 0px);">Showcase</div>'
$hero = $hero -replace 'O Residencial Portobello oferece o ápice da sofisticação e da privacidade em Mangaratiba. Um complexo restrito a apenas 5 residências exclusivas de altíssimo luxo, com lotes de 2.695 m², 980 m² construídos e <strong class="text-\[#1E3040\]">hangar aeronáutico privativo de 875 m²</strong> — um diferencial único para quem vive em outro ritmo.', 'Este documento serve como um repositório central para todos os elementos de design, componentes e padrões interativos utilizados na interface. Preserve e reutilize as classes, componentes e animações documentados aqui para garantir consistência em toda a aplicação.'
$hero = $hero -replace 'Rod\. Rio Santos, KM 434 — Mangaratiba, RJ', 'Design System & Pattern Library'
$hero = $hero -replace 'Solicitar Informações', 'Explorar Componentes'
$hero = $hero -replace 'href="#contato"', 'href="#components"'
$hero = $hero -replace 'Ver Disponibilidade', 'Ver Tipografia'
$hero = $hero -replace 'href="#disponibilidade"', 'href="#typography"'
$hero = $hero -replace '5 residências exclusivas – Mangaratiba, RJ', 'Referência para desenvolvedores'
$hero = $hero -replace 'Área Construída', 'Componentes'
$hero = $hero -replace 'id="metric-1-num">980', 'id="metric-1-num">24'
$hero = $hero -replace 'm²', 'itens'
$hero = $hero -replace 'Área do Lote', 'Cores'
$hero = $hero -replace 'id="metric-2-num">2.695', 'id="metric-2-num">5'
$hero = $hero -replace 'Hangar Aeronáutico', 'Animações'
$hero = $hero -replace 'id="metric-3-num">875', 'id="metric-3-num">8'

$finalOutput = $head + "`n" + $header + "`n<main>`n" + $hero + "`n" + $extra + "`n</main>`n" + $foot
$finalOutput | Out-File -FilePath $outPath -Encoding utf8
