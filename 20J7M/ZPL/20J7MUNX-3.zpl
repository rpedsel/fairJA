set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 7.8281, <2> 49.0494, <3> 47.9045, <4> 40.5727, <5> 42.1568, <6> 9.0275, <7> 12.757, <8> 37.8146, <9> 23.3855, <10> 0.7725, <11> 31.3632, <12> 6.8508, <13> 34.9553, <14> 36.5974, <15> 33.8502, <16> 23.4248, <17> 11.8549, <18> 37.6015, <19> 3.6717, <20> 16.7869;
param workload[JOB] := <1> 2.7979, <2> 7.0035, <3> 6.9213, <4> 6.3697, <5> 6.4928, <6> 3.0046, <7> 3.5717, <8> 6.1494, <9> 4.8359, <10> 0.8789, <11> 5.6003, <12> 2.6174, <13> 5.9123, <14> 6.0496, <15> 5.8181, <16> 4.8399, <17> 3.4431, <18> 6.132, <19> 1.9162, <20> 4.0972;
param capacity[MACHINE] := <1> 94.4518, <2> 94.4518, <3> 94.4518, <4> 94.4518, <5> 94.4518, <6> 94.4518, <7> 94.4518;

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
