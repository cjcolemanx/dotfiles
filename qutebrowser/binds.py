### => Unbind

leader = ','

# back -t
config.unbind('th', mode='normal')
# forward -t
config.unbind('tl', mode='normal')
# tab-next
config.unbind('J', mode='normal')
# tab-prev
config.unbind('K', mode='normal')

# Add a new tab (default to search engine)
config.bind('ta', 'open -t https://duckduckgo.com/')

# Move between tabs
config.bind('th', 'tab-prev')
config.bind('tl', 'tab-next')
config.bind('toh', 'back -t')
config.bind('tol', 'forward -t')

# Doesn't Work! Need to config mpv? (New to mpv : ])
config.bind(leader + 'v', 'spawn mpv {url}')
            
# Update AdBlock
config.bind(leader + 'ua', 'set-cmd-text :adblock-update')

# Rebind resizing
# config.unbind('<Ctrl-=>', 'zoom-in')
# config.unbind('<Ctrl-->', 'zoom-out')
