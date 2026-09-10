import re
try:
    re._pattern_type = type(re.compile(''))
except Exception:
    pass

import traceback
try:
    import argostranslate.package
    print("Success")
except Exception:
    traceback.print_exc()
