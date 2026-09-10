import traceback
try:
    import argostranslate.package
    print("Success")
except Exception:
    traceback.print_exc()
