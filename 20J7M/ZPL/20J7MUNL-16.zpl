set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.4548, <2> 15.5276, <3> 32.0243, <4> 15.373, <5> 3.8532, <6> 17.4683, <7> 31.0136, <8> 1.0644, <9> 13.3796, <10> 8.7471, <11> 4.6464, <12> 19.1337, <13> 26.0104, <14> 25.0362, <15> 24.5521, <16> 25.7386, <17> 39.7511, <18> 30.1469, <19> 23.1457, <20> 11.385;
param workload[JOB] := <1> 32.4548, <2> 15.5276, <3> 32.0243, <4> 15.373, <5> 3.8532, <6> 17.4683, <7> 31.0136, <8> 1.0644, <9> 13.3796, <10> 8.7471, <11> 4.6464, <12> 19.1337, <13> 26.0104, <14> 25.0362, <15> 24.5521, <16> 25.7386, <17> 39.7511, <18> 30.1469, <19> 23.1457, <20> 11.385;
param capacity[MACHINE] := <1> 400.452, <2> 400.452, <3> 400.452, <4> 400.452, <5> 400.452, <6> 400.452, <7> 400.452;

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
