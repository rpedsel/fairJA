set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.9675, <2> 15.092, <3> 21.7583, <4> 22.7689, <5> 43.8743, <6> 10.6467, <7> 33.105, <8> 3.1323, <9> 18.4341, <10> 39.3649, <11> 20.8892, <12> 9.6362, <13> 1.7164, <14> 11.2378, <15> 43.2006, <16> 29.1863, <17> 19.2055, <18> 2.871, <19> 8.7962, <20> 46.4322;
param workload[JOB] := <1> 4.4685, <2> 3.8848, <3> 4.6646, <4> 4.7717, <5> 6.6238, <6> 3.2629, <7> 5.7537, <8> 1.7698, <9> 4.2935, <10> 6.2741, <11> 4.5705, <12> 3.1042, <13> 1.3101, <14> 3.3523, <15> 6.5727, <16> 5.4024, <17> 4.3824, <18> 1.6944, <19> 2.9658, <20> 6.8141;
param capacity[MACHINE] := <1> 9.2074, <2> 9.2074, <3> 9.2074, <4> 9.2074, <5> 9.2074, <6> 9.2074, <7> 9.2074;

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
