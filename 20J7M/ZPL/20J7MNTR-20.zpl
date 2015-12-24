set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 15.8138, <2> 28.0886, <3> 21.1848, <4> 21.55, <5> 24.1153, <6> 28.0229, <7> 29.4876, <8> 26.6166, <9> 22.8194, <10> 27.4617, <11> 17.6151, <12> 32.1304, <13> 16.5896, <14> 26.2624, <15> 22.8954, <16> 25.8492, <17> 34.3271, <18> 18.1259, <19> 18.0334, <20> 21.291;
param workload[JOB] := <1> 16.7163, <2> 2.5602, <3> 11.7069, <4> 23.1212, <5> 3.0401, <6> 42.3982, <7> 43.7258, <8> 1.9315, <9> 1.1616, <10> 15.18, <11> 31.3635, <12> 45.8539, <13> 35.4219, <14> 38.5619, <15> 26.5667, <16> 1.4224, <17> 30.8031, <18> 41.2929, <19> 27.3146, <20> 12.2337;
param capacity[MACHINE] := <1> 48.4689, <2> 48.4689, <3> 48.4689, <4> 48.4689, <5> 48.4689, <6> 48.4689, <7> 48.4689;

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
