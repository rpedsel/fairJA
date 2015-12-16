set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0225, <2> 17.2018, <3> 46.3214, <4> 31.8764, <5> 8.2306, <6> 40.9355, <7> 26.6984, <8> 22.9075, <9> 16.7406, <10> 40.213, <11> 43.1094, <12> 16.1796, <13> 28.0978, <14> 14.5395, <15> 10.3674, <16> 32.9853, <17> 30.4336, <18> 19.5456, <19> 8.4843, <20> 11.4132;
param workload[JOB] := <1> 4.6928, <2> 4.1475, <3> 6.806, <4> 5.6459, <5> 2.8689, <6> 6.3981, <7> 5.167, <8> 4.7862, <9> 4.0915, <10> 6.3414, <11> 6.5658, <12> 4.0224, <13> 5.3007, <14> 3.8131, <15> 3.2198, <16> 5.7433, <17> 5.5167, <18> 4.421, <19> 2.9128, <20> 3.3783;
param capacity[MACHINE] := <1> 15.9732, <2> 15.9732, <3> 15.9732, <4> 15.9732, <5> 15.9732, <6> 15.9732;

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
