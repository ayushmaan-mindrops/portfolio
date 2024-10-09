import { toast } from "sonner";
import "./App.css";

function App() {
  return (
    <>
      <h1>Ayushmaan's Portfolio</h1>
      <button onClick={() => toast.success("CI/CD words")}>Check Change</button>
    </>
  );
}

export default App;
