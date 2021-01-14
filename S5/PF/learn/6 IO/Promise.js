/* Exemple d’utilisation de Promise */

// Pour node :
// var fetch = require('node-fetch')

fetch("https://gitlab-etu.fil.univ-lille1.fr/api/v4/user")
    .then(r => r.json())
    .then(x => { console.log(x) })

/* Voir le type (complexe !) associé à then :
 *
 * https://github.com/microsoft/TypeScript/blob/5b9a56fc4db312744b8e663cc72e5314d1536751/src/lib/es5.d.ts#L1386
 */
