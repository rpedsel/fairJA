set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.9947, <2> 7.2763, <3> 11.2349, <4> 33.7412, <5> 42.1394, <6> 37.9081, <7> 32.467, <8> 40.7449, <9> 8.5106, <10> 17.8711, <11> 49.0314, <12> 3.9279, <13> 6.0769, <14> 5.1389, <15> 14.8629, <16> 12.5981, <17> 16.1562, <18> 19.7685, <19> 13.7236, <20> 11.5162;
param workload[JOB] := <1> 4.3583, <2> 2.6975, <3> 3.3519, <4> 5.8087, <5> 6.4915, <6> 6.157, <7> 5.698, <8> 6.3832, <9> 2.9173, <10> 4.2274, <11> 7.0022, <12> 1.9819, <13> 2.4651, <14> 2.2669, <15> 3.8552, <16> 3.5494, <17> 4.0195, <18> 4.4462, <19> 3.7045, <20> 3.3936;
param capacity[MACHINE] := <1> 84.7753, <2> 84.7753, <3> 84.7753, <4> 84.7753, <5> 84.7753, <6> 84.7753;

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
