import { Suspense } from "react"

import HomeClient from "@/app/HomeClient"

// Next.js 16+: `useSearchParams()` triggers a CSR bailout and must be wrapped in a Suspense boundary.
// We keep `/` as a Server Component and render the client UI within a top-level <Suspense />.
export default function HomePage() {
  return (
    <Suspense fallback={null}>
      <HomeClient />
    </Suspense>
  )
}
