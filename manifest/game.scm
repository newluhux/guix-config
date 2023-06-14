(use-modules (gnu) (guix profiles))
(use-package-modules games minetest)

(define-public %game-packages
  (list warzone2100 cataclysm-dda nethack curseofwar minetest))

(packages->manifest %game-packages)
