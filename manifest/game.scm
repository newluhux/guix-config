(use-modules (gnu) (guix profiles))
(use-package-modules games minetest emulators)

(define-public %game-packages
  (list cataclysm-dda nethack curseofwar
        nestopia-ue mgba ppsspp))

(packages->manifest %game-packages)
