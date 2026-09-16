#include <memory>
#include <print>
#include <sstream>

int main() {
  std::unique_ptr<FILE, decltype(&pclose)> fp(popen("cat /proc/uptime", "r"), pclose);
  char                                     buffer[64];
  std::fgets(buffer, sizeof(buffer), fp.get());

  long uptime;
  std::istringstream(buffer) >> uptime;

  auto [total_hours, minutes] = std::div(uptime / 60, 60L);
  auto [days, hours]          = std::div(total_hours, 24L);

  int cnt = 0;
  for (auto [key, value] : std::initializer_list<std::pair<std::string_view, long>>{
           std::make_pair("day", days),
           std::make_pair("hour", hours),
           std::make_pair("minute", minutes) }) {
    if (!value)
      continue;
    std::print("{}{} {}{}", cnt++ ? ", " : "", value, key, value != 1 ? "s" : "");
  }

  if (cnt == 0)
    std::print("0 minutes");
  std::println();
}
