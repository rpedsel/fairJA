set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.1785, <2> 49.5062, <3> 33.5959, <4> 45.3428, <5> 29.8443, <6> 15.5502, <7> 39.0768, <8> 31.8908, <9> 37.7095, <10> 30.5193;
param workload[JOB] := <1> 1779.0259, <2> 2450.8638, <3> 1128.6845, <4> 2055.9695, <5> 890.6822, <6> 241.8087, <7> 1526.9963, <8> 1017.0231, <9> 1422.0064, <10> 931.4277;
param capacity[MACHINE] := <1> 3361.122, <2> 3361.122, <3> 3361.122;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
