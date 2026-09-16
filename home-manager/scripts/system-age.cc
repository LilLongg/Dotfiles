#include <chrono>
#include <memory>
#include <print>
#include <sstream>

namespace ch = std::chrono;

int main() {
  std::unique_ptr<FILE, decltype(&pclose)> fp(popen("stat -c %w /", "r"), pclose);
  char                                     buffer[64];
  std::fgets(buffer, sizeof(buffer), fp.get());

  ch::time_point<ch::system_clock> start_time;
  std::istringstream(buffer) >> ch::parse("%F %T %z", start_time);
  auto current_time = ch::system_clock::now();
  auto system_age   = ch::duration_cast<ch::minutes>(current_time - start_time).count();

  auto [total_hours, age_minutes]   = std::div(system_age, 60L);
  auto [total_days, age_hours]      = std::div(total_hours, 24L);
  auto [total_months, age_days]     = std::div(total_days, 61L);
  total_months                    <<= 1;
  if (age_days > 30) {
    ++total_months;
    age_days -= 30;
  }
  auto [age_years, age_months] = std::div(total_months, 12L);

  int cnt = 0;
  for (auto [key, value] : std::initializer_list<std::pair<std::string_view, long>>{
           std::make_pair("year", age_years),
           std::make_pair("month", age_months),
           std::make_pair("day", age_days),
           std::make_pair("hour", age_hours),
           std::make_pair("minute", age_minutes) }) {
    if (!value)
      continue;
    std::print("{}{} {}{}", cnt++ ? ", " : "", value, key, value > 1 ? "s" : "");

    if (cnt == 3)
      break;
  }

  std::println();
}
