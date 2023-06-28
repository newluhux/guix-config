(use-modules (gnu) (guix profiles))
(use-package-modules games minetest emulators)

(define-public %game-packages
  (list warzone2100 cataclysm-dda nethack curseofwar minetest
        nestopia-ue mgba ppsspp))

(packages->manifest %game-packages)
