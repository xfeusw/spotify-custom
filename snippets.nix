[
  # Circular Album Art
  ".cover-art-image { clip-path: circle(50% at 50% 50%); } .main-nowPlayingBar-left { border-radius: 50%; }"

  # Oneko
  ".player-controls .playback-progressbar::before { content: ''; width: 32px; height: 32px; bottom: calc(100% - 7px); right: 10px; position: absolute; image-rendering: pixelated; background-image: url('https://raw.githubusercontent.com/adryd325/oneko.js/14bab15a755d0e35cd4ae19c931d96d306f99f42/oneko.gif'); animation: oneko 1s infinite; } @keyframes oneko { 0%, 50% { background-position: -64px 0; } 50.0001%, 100% { background-position: -64px -32px; } }"

  # Spinning CD Cover Art
  "@keyframes rotating { from { transform: rotate(0deg); } to { transform: rotate(360deg); } } .cover-art { animation: rotating 360s linear infinite; clip-path: circle(50% at 50% 50%); position: relative; } .cover-art::after { content: ''; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 22%; height: 22%; background: radial-gradient(circle at center, rgba(24, 22, 35, 0.9) 0%, rgba(24, 22, 35, 0.9) 38%, rgba(255, 255, 255, 0.1) 38%, rgba(255, 255, 255, 0.1) 40%, rgba(24, 22, 35, 0.9) 40%, rgba(24, 22, 35, 0.9) 100%), repeating-radial-gradient(circle at center, rgba(255, 255, 255, 0.1) 0, rgba(255, 255, 255, 0.1) 1px, transparent 1px, transparent 4px); border-radius: 50%; pointer-events: none; box-shadow: 0 0 10px rgba(0, 0, 0, 0.3) inset, 0 0 20px rgba(255, 255, 255, 0.1); } .cover-art::before { content: ''; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); width: 6%; height: 6%; background: rgba(24, 22, 35, 1); border-radius: 50%; box-shadow: 0 0 5px rgba(255, 255, 255, 0.2); z-index: 1; } .main-nowPlayingBar-left button { background: transparent; }"
]
