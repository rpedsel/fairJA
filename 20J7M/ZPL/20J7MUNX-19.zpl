set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.145, <2> 28.9357, <3> 43.2101, <4> 13.8351, <5> 12.1512, <6> 19.3397, <7> 10.4387, <8> 34.7883, <9> 27.0571, <10> 0.2677, <11> 16.1563, <12> 22.0314, <13> 40.5723, <14> 14.5759, <15> 3.7589, <16> 4.677, <17> 30.2879, <18> 15.78, <19> 29.216, <20> 17.5225;
param workload[JOB] := <1> 5.8434, <2> 5.3792, <3> 6.5734, <4> 3.7196, <5> 3.4859, <6> 4.3977, <7> 3.2309, <8> 5.8982, <9> 5.2016, <10> 0.5174, <11> 4.0195, <12> 4.6938, <13> 6.3696, <14> 3.8178, <15> 1.9388, <16> 2.1626, <17> 5.5034, <18> 3.9724, <19> 5.4052, <20> 4.186;
param capacity[MACHINE] := <1> 86.3164, <2> 86.3164, <3> 86.3164, <4> 86.3164, <5> 86.3164, <6> 86.3164, <7> 86.3164;

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
