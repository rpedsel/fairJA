set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.2789, <2> 15.606, <3> 38.9769, <4> 10.004, <5> 12.0408, <6> 24.603, <7> 0.7606, <8> 42.1864, <9> 4.2614, <10> 11.2825, <11> 18.9891, <12> 10.2721, <13> 33.7272, <14> 12.8803, <15> 7.342, <16> 28.5059, <17> 34.287, <18> 36.1497, <19> 31.7022, <20> 19.3618;
param workload[JOB] := <1> 33.2789, <2> 15.606, <3> 38.9769, <4> 10.004, <5> 12.0408, <6> 24.603, <7> 0.7606, <8> 42.1864, <9> 4.2614, <10> 11.2825, <11> 18.9891, <12> 10.2721, <13> 33.7272, <14> 12.8803, <15> 7.342, <16> 28.5059, <17> 34.287, <18> 36.1497, <19> 31.7022, <20> 19.3618;
param capacity[MACHINE] := <1> 45.6662, <2> 45.6662, <3> 45.6662, <4> 45.6662, <5> 45.6662, <6> 45.6662, <7> 45.6662;

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
