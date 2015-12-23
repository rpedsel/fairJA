set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.3505, <2> 45.0653, <3> 34.9176, <4> 15.3051, <5> 18.7406, <6> 45.2394, <7> 37.3178, <8> 10.0438, <9> 24.0562, <10> 22.7544, <11> 0.643, <12> 12.0858, <13> 10.3084, <14> 47.3612, <15> 24.8054, <16> 6.0602, <17> 31.0098, <18> 48.2136, <19> 21.4692, <20> 24.0917;
param workload[JOB] := <1> 35.1567, <2> 18.0738, <3> 27.9148, <4> 43.2986, <5> 9.828, <6> 37.8942, <7> 1.7301, <8> 33.2804, <9> 46.1244, <10> 11.2035, <11> 1.4128, <12> 6.2583, <13> 7.4619, <14> 37.7561, <15> 35.4278, <16> 36.251, <17> 20.6994, <18> 42.0497, <19> 26.9181, <20> 29.3669;
param capacity[MACHINE] := <1> 72.5866, <2> 72.5866, <3> 72.5866, <4> 72.5866, <5> 72.5866, <6> 72.5866, <7> 72.5866;

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
