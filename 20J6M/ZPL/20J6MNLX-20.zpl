set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 22.0962, <2> 18.8286, <3> 28.5863, <4> 29.755, <5> 30.9079, <6> 24.1801, <7> 28.5424, <8> 27.379, <9> 21.6915, <10> 28.8848, <11> 30.0274, <12> 22.731, <13> 21.7035, <14> 19.9387, <15> 31.0344, <16> 27.0887, <17> 21.8402, <18> 28.1782, <19> 18.9818, <20> 16.5525;
param workload[JOB] := <1> 4.7007, <2> 4.3392, <3> 5.3466, <4> 5.4548, <5> 5.5595, <6> 4.9173, <7> 5.3425, <8> 5.2325, <9> 4.6574, <10> 5.3745, <11> 5.4797, <12> 4.7677, <13> 4.6587, <14> 4.4653, <15> 5.5709, <16> 5.2047, <17> 4.6733, <18> 5.3083, <19> 4.3568, <20> 4.0685;
param capacity[MACHINE] := <1> 16.5798, <2> 16.5798, <3> 16.5798, <4> 16.5798, <5> 16.5798, <6> 16.5798;

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
