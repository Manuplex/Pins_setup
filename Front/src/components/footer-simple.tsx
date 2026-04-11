export const FooterSimple = () => {
  return (
    <footer className="bg-background text-primary px-6 py-20 min-h-screen">
      <div className="max-w-7xl mx-auto flex flex-col md:flex-row justify-between items-start gap-5">
        <div className="space-y-6">
          <div className="text-2xl font-bold">UI-LAYOUTS.</div>
          <p className="text-zinc-500 max-w-xs text-pretty">
            Redefining the digital frontier with elegance and precision.
          </p>
        </div>

          <div className="space-y-4">
            <div className="font-bold text-lg text-center  uppercase tracking-widest text-zinc-400">
              Social
            </div>
            <div className="flex gap-2  text-sm text-zinc-600">
              <a href="#" className="hover:text-primary">
                Twitter
              </a>
              <a href="#" className="hover:text-primary">
                LinkedIn
              </a>
              <a href="#" className="hover:text-primary">
                Instagram
              </a>
            </div>
        </div>
      </div>
      <div className="max-w-7xl mx-auto mt-20 pt-8 border-t border-zinc-50 text-xs text-zinc-400 flex justify-between">
        <span>&copy; 2026 UI-Layouts. All rights reserved.</span>
        <span>Made with Precision.</span>
      </div>
    </footer>
  )
}
